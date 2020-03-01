package ua.com.novykov.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.com.novykov.models.Message;
import ua.com.novykov.repositories.MessageRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MessageService {
    private final MessageRepository messageRepository;

    public void save(Message message){
        messageRepository.save(message);
    }

    public List<Message> messages(){
        List<Message> messages = messageRepository.findAll();
        return messages;
    }

    public List<Message> findByTag(String tag){
        List<Message> messeges =  messageRepository.findByTag(tag);
        return messeges;
    }

}
