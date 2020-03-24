package com.codesquad.signup.repository;

import com.codesquad.signup.domain.User;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User, Long> {

    @Query("select case when count(user_id) > 0 then true else false end from user u where u.user_id = :userId")
    boolean existsByUserId(@Param("userId") String userId);

    @Query("select case when count(email) > 0 then true else false end from user u where u.email = :email")
    boolean existsByEmail(@Param("email") String email);

    @Query("select case when count(mobile) > 0 then true else false end from user u where u.mobile = :mobile")
    boolean existsByMobile(@Param("mobile") String mobile);

    @Query("select u from User u where u.id = :user_key")
    Optional<User> findIdById(@Param("user_key") Long id);
}
