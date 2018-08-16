package com.capstone.db.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

public class User
{
    private String username;
    private List<String> authorities;

    public User(String username)
    {
        this.username = username;
        authorities = new ArrayList<>();
    }
    public User(Authentication auth)
    {
        this.username = auth.getName();
        authorities = new ArrayList<>();
        for(GrantedAuthority authority:auth.getAuthorities())
            authorities.add(authority.getAuthority());
    }

    public String getUsername()
    {
        return username;
    }

    public List<String> getAuthorities()
    {
        return authorities;
    }

    @Override
    public boolean equals(Object o)
    {
        if(this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(username, user.username) &&
                Objects.equals(authorities, user.authorities);
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(username, authorities);
    }
}
