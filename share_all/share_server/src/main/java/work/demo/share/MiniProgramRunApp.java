package work.demo.share;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@ServletComponentScan(basePackages = "work.demo.share.*")
@MapperScan(basePackages = "work.demo.share.mapper")
@EnableTransactionManagement
public class MiniProgramRunApp extends SpringBootServletInitializer {
    /**
     * 以下为Tomcat启动
     *
     * @param application
     * @return
     */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MiniProgramRunApp.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(MiniProgramRunApp.class, args);
    }

}




