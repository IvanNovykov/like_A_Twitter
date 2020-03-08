package ua.com.novykov.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.novykov.models.Message;
import ua.com.novykov.models.User;
import ua.com.novykov.service.MessageService;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final MessageService messageService;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String tag, Model model) {
        List<Message> messages = messageService.messages();
        if(tag !=null && !tag.isEmpty()){
            messages = messageService.findByTag(tag);}
        else {
            messages = messageService.messages();
        }
        model.addAttribute("messages", messages);
        model.addAttribute("tag", tag);
        return "main";
    }
    @PostMapping("addUser")
        public String add(
                @AuthenticationPrincipal User user,
                @RequestParam String text,
                @RequestParam String tag, Map<String, Object> model) {
            Message message = new Message(text, tag, user);
            messageService.save(message);
            List<Message> messages = messageService.messages();
            model.put("messages", messages);
            return "main";
    }

    @PostMapping("delete")
    public String deleteMessage(@RequestParam Long id, Map<String, Object> model){
        messageService.deleteById(id);
        return "main";
    }
}
