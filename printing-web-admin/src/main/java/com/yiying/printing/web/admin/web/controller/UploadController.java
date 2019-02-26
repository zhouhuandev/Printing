package com.yiying.printing.web.admin.web.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 文件上传控制器
 *
 * @Title:UploadController
 * @Author hz_zhouhuan
 * @Version 1.0.0
 * @Date 2019/1/31 16:52
 */
@Controller
@RequestMapping(value = "upload")
public class UploadController {

    public static final String UPLOAD_PATH_IMG = "/static/upload/img/";
    public static final String UPLOAD_PATH_FILE = "/static/upload/file/";

    @ResponseBody
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public Map<String, Object> upload(MultipartFile dropzFile, MultipartFile[] editorFiles, MultipartFile[] file_data, HttpServletRequest request, Model model) {
        Map<String, Object> map = new HashMap<>();

        //测试 request 都接到什么参数
//        Enumeration enu=request.getParameterNames();
//        while(enu.hasMoreElements()){
//            String paraName=(String)enu.nextElement();
//            System.out.println(paraName+": "+request.getParameter(paraName));
//        }

        //fileInput 上传
        if (file_data != null) {
            //url 地址名
            List<String> fileUrlNames = new ArrayList<>();
            //原文件名
            List<String> fileNames = new ArrayList<>();
            for (MultipartFile uploadfile : file_data) {
                try {
                    fileNames.add(uploadfile.getOriginalFilename());
                    fileUrlNames.add(writeFile(uploadfile, request, UPLOAD_PATH_FILE));
                } catch (Exception e) {
                    map.put("error", "上传异常，请刷新以后重新上传！");
                }
            }
            map.put("fileNames", fileNames);
            map.put("fileUrlNames", fileUrlNames);
        }
        //Dropzone上传
        if (dropzFile != null) {
            map.put("fileName", writeFile(dropzFile, request, UPLOAD_PATH_IMG));
        }
        //wangEditor上传
        if (editorFiles != null && editorFiles.length > 0) {
            List<String> fileNames = new ArrayList<>();

            for (MultipartFile editorFile :
                    editorFiles) {
                fileNames.add(writeFile(editorFile, request, UPLOAD_PATH_IMG));
            }
            // errno 即错误代码，0 表示没有错误。
            //       如果有错误，errno != 0，可通过下文中的监听函数 fail 拿到该错误码进行自定义处理
            map.put("errno", 0);
            // data 是一个数组，返回若干图片的线上地址
            map.put("data", fileNames);
        }
        return map;
    }

    /**
     * 将文件写入指定目录
     *
     * @param multipartFile
     * @param request
     * @return
     */
    private String writeFile(MultipartFile multipartFile, HttpServletRequest request, String upload_path) {
        //获取文件名后缀
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));

        //文件存放路径
        String filePath = request.getSession().getServletContext().getRealPath(upload_path);

        //判断路径是否存在，不存在则创建文件夹
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdir();
        }

        //将文件写入指定目录
        file = new File(filePath, UUID.randomUUID() + fileSuffix);
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        /**
         * Scheme: 服务器提供的协议 http / htpps
         * ServerName : 服务器名称 localhost / ip / domain
         * ServerPort : 服务器端口号
         */
        //返回文件完整路径
        //服务器地址
        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();

        return serverPath + upload_path + file.getName();
    }


    /**
     * 移除文件信息
     *
     * @param fileUrlNames 文件的全路径 http:// .....
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "remove", method = RequestMethod.POST)
    public Map<String, Object> remove(String fileUrlNames, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        List<String> msgList = new ArrayList<>();//存放消息的列表
        String msg = "";//存放每次获取的消息

        //判断参数进行分割 "," 逗号是分界线
        if (StringUtils.isNotBlank(fileUrlNames)) {
            List<String> fileNameLists = Arrays.asList(fileUrlNames.split(","));
            for (String fileNameList : fileNameLists) {
                msg = removeFile(fileNameList, request);
                msgList.add(fileNameList + ":" + msg + "\n");
            }
            map.put("msg", msgList);
        }


        return map;
    }


    /**
     * 移除指定地址的文件
     *
     * @param fileName
     * @param request
     * @return
     */
    private String removeFile(String fileName, HttpServletRequest request) {
        String result = "";
        //服务器地址
        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        //截掉服务器地址后的地址，以 /static/upload 开头
        String fileNameSuffix = fileName.substring(serverPath.length(), fileName.length());
        //获取当前项目路径
        String filePath = request.getSession().getServletContext().getRealPath("/");
        File file = new File(filePath + fileNameSuffix);
        //如果文件存在且是个文件的话，执行删除操作
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                result =  "文件移除成功！";
            } else {
                result =  "文件移除失败！";
            }
        } else {
            result =  "文件不存在！";
        }
        return result;
    }
}
