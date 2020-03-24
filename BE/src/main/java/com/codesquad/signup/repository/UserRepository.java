package com.codesquad.signup.repository;

import com.codesquad.signup.domain.User;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User, Long> {

    @Query("SELECT * FROM USER WHERE ID")
    Optional<User> findById(Long id);
}
