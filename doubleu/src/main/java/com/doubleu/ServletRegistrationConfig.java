package com.doubleu;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.doubleu.approval.controller.FileDownload;

@Configuration
public class ServletRegistrationConfig
{
	@Bean
	public ServletRegistrationBean getServletRegistrationBean()
	{
		ServletRegistrationBean registrationBean = new ServletRegistrationBean(new FileDownload());
		registrationBean.addUrlMappings("/FileDownload");
		return registrationBean;
	}
}