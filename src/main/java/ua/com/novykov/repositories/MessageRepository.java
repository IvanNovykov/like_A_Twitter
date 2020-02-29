package ua.com.novykov.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.com.novykov.models.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {

}
