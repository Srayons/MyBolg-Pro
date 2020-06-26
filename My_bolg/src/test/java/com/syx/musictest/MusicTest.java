package com.syx.musictest;

import com.bolg.config.PrefixConfig;
import com.bolg.util.MD5Util;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.List;

@RunWith(JUnit4.class)
public class MusicTest {

    @Test
    public void test() throws IOException {

        //1.创建连接client
        WebClient webClient = new WebClient(BrowserVersion.CHROME);
        //2.设置连接的相关选项
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setJavaScriptEnabled(true);  //需要解析js
        webClient.getOptions().setThrowExceptionOnScriptError(false);  //解析js出错时不抛异常
        webClient.setAjaxController(new NicelyResynchronizingAjaxController());
        webClient.getOptions().setTimeout(10000);  //超时时间  ms
        //3.抓取页面
        HtmlPage page = webClient.getPage("http://music.163.com/#/search/m/?s=北京");
        webClient.addRequestHeader("Host","music.163.com");
        webClient.addRequestHeader("Referer","https://music.163.com/");
        webClient.addRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
        String pageXml = page.asXml();

        //JSoup解析页面
        Document document = Jsoup.parse(pageXml, "http://music.163.com/");
        String text = document.select(".g-btmbar .m-playbar m-playbar-lock #g_player .ctrl f-fl f-pr j-flag .add f-pr").text();
        /*System.out.println(element.text());*/
        System.out.println(text);
        /*List<FrameWindow> frames = page.getFrames();
        for (FrameWindow frame : frames) {
            HtmlPage htmlPage = frame.getEnclosingPage();
            System.out.println(htmlPage.asXml());
        }
        //4.将页面转成指定格式
        webClient.waitForBackgroundJavaScript(2000);   //等侍js脚本执行完成*/
        //System.out.println(page.asXml());
        //5.关闭模拟的窗口
        webClient.closeAllWindows();
        /*String rLine;
        String startLine = "<iframe name=\"contentFrame\" id=\"g_iframe\" class=\"g-iframe\" scrolling=\"auto\" frameborder=\"0\" src=\"about:blank\" allowfullscreen=\"true\">";
        String endLine = "";
        boolean isNode = false;
        LinkedHashMap<String,String> keyMap = new LinkedHashMap<String,String>();

        URL url = new URL("view-source:https://music.163.com/#/search/m/?s=北京");
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setDoInput(true);
        httpURLConnection.setRequestMethod("GET");
        httpURLConnection.setRequestProperty("Host","music.163.com");
        httpURLConnection.setRequestProperty("Referer","https://music.163.com/");
        httpURLConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
        InputStreamReader inputStreamReader = new InputStreamReader(httpURLConnection.getInputStream(), StandardCharsets.UTF_8);
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        while ((rLine = bufferedReader.readLine())!=null){
            if (rLine.contains(startLine)){
                System.out.println(rLine);
                isNode = true;
            }
            //System.out.println(rLine);
        }
        inputStreamReader.close();
        bufferedReader.close();
        httpURLConnection.disconnect();*/
    }


    @Test
    public void test2(){
        Integer integer = 0;
        integer.intValue();
        System.out.println(integer);
    }

}
