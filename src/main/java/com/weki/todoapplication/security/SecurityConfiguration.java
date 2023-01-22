package com.weki.todoapplication.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
public class SecurityConfiguration {

    @Bean
    public InMemoryUserDetailsManager createUserDetailsManager() {
        UserDetails userDetails1 = userDetails("weki", "root");
        UserDetails userDetails2 = userDetails("unknown", "root");
        return new InMemoryUserDetailsManager(userDetails1, userDetails2);
    }
    public UserDetails userDetails(String name, String pswrd) {
        UserDetails userDetails = User.builder().passwordEncoder( input -> passwordEncoder().encode(input) ).username(name).password(pswrd).roles("USER", "ADMIN").build();
        return userDetails;
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests( auth -> auth.anyRequest().authenticated() );

        http.formLogin(withDefaults() ); //withDefaults() static imported => import static org.springframework.security.config.Customizer.withDefaults;


        http.csrf().disable(); //disable csrf
        http.headers().frameOptions().disable(); //Enables Frames

        return http.build();
    }

}