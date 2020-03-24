package com.codesquad.signup.repository;

import com.codesquad.signup.domain.User;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends CrudRepository<User, Long> {

    @Query("SELECT * FROM U WHERE U.ID =: Id")
    User findUserById(@Param("Id") Long id);
}
