package com.gs.controller;

import ch.qos.logback.classic.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/head")
public class headController {

    private Logger logger = (Logger) LoggerFactory.getLogger(headController.class);

    /**
     * edit
     */
    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String edit() {
        return "head/form_avatar";
    }
}
