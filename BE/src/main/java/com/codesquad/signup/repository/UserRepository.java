package com.codesquad.signup.repository;

import com.codesquad.signup.domain.User;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.math.BigInteger;
import java.util.Optional;

public interface UserRepository extends CrudRepository<User, BigInteger> {

    @Query("select * from USERS where user_id = :userId")
    Optional<User> findUserByUserId (@Param("userId") String userId);

    @Query("select * from USERS where email = :email")
    Optional<User> findUserByEmail (@Param("email") String email);

    @Query("select * from USERS where mobile = :mobile")
    Optional<User> findUserByMobile (@Param("mobile") String mobile);

    @Query("select u from User u where u.id = :user_key")
    Optional<User> findIdById(@Param("user_key") Long id);
}
