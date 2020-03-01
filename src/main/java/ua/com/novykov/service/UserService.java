package ua.com.novykov.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.com.novykov.models.User;
import ua.com.novykov.repositories.UserRepository;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

   public  User findUserByName(String name){
        return userRepository.findByUsername(name);
    }
    public void save(User user){
       userRepository.save(user);
    }
}
