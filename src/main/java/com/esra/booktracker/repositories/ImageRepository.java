package com.esra.booktracker.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.esra.booktracker.models.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {
	Optional<Image> findByName(String name);
}
