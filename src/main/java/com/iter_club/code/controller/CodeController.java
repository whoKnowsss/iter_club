package com.iter_club.code.controller;

import com.iter_club.portal.controller.MainController;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
@RequestMapping("/code")
public class CodeController {
    //   /code/method=html
    @Autowired
    MainController mainController;

    @RequestMapping("/method={type}")
    public String gotohtml(@PathVariable("type") String type, Model model, HttpServletRequest request) {
        if (type.equals("html") || type.equals("java") || type.equals("js")) {
            model.addAttribute("type", type);
            return "code/code-html";
        } else
            return mainController.index(request, request.getSession());
    }


    private Compiler compi = null;
    private BufferedWriter bw = null;
    private String className = null;//文件名
    private String result = null;//编译运行的结果
    private String realpathdir = null;//代码临时存储的路径
    private String batPathdir = null;//编译的脚本所在地
    private static Process process;

    @ResponseBody
    @RequestMapping(value = "/java/compile", method = RequestMethod.POST)
    public JSONObject compilejava(@RequestParam("code")String code, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JSONObject jsonObject=new JSONObject();

        System.out.println(code);



        realpathdir = req.getSession().getServletContext()
                .getRealPath("/styles");
        System.out.println(realpathdir);

        batPathdir = req.getSession().getServletContext()
                .getRealPath("/styles");
        System.out.println(batPathdir);


        try {
            validate(code);
        } catch (IOException e1) {
            e1.printStackTrace();
        }


        try {
            System.out.println("complier&running");
            result = new ComplierVer2().ComplierCode(className, batPathdir,realpathdir);
//			result = new Complier().ComplierCode(className, batPathdir, realpathdir);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        jsonObject.put("result",result);
        return jsonObject;

    }

    /**
     * @param code 客户端编写的代码
     * @return 格式初步的验证如果正确返回true，不正确返回false
     * @throws IOException
     */
    private boolean validate(String code) throws IOException {
        String classStr = null;
        String[] classStrArray = null;


        classStr = code.substring(code.indexOf("public class"), code.indexOf("{"));
        classStrArray = classStr.split("\\s{1,}");
        className = classStrArray[classStrArray.length - 1];
        System.out.println(className);

        File sourceFileJava = new File(realpathdir, className + ".java");
        File sourceFileClass = new File(realpathdir, className + ".class");
        if (sourceFileJava.exists()) {
            sourceFileJava.delete();
            sourceFileClass.delete();
        }
        FileWriter fr = new FileWriter(sourceFileJava);
        bw = new BufferedWriter(fr);
        bw.write(code);
        bw.close();
        fr.close();
        return true;
    }
}
