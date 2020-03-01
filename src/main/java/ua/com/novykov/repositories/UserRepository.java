package ua.com.novykov.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.novykov.models.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);
}
