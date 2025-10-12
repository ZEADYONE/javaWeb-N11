package com.n11.sportshop.service;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Role;
import com.n11.sportshop.repository.RoleRepository;

@Service
public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }
}
