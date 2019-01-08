package com.example.warehouse.service;

import com.example.warehouse.dao.PartDao;
import com.example.warehouse.model.Part;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PartService {
    private PartDao partDao;

    public void setPartDao(PartDao partDao) {
        this.partDao = partDao;
    }

    @Transactional
    public List<Part> getAllParts() {
        return partDao.getAllParts();
    }

    @Transactional
    public void addPart(Part part) {
        partDao.addBook(part);
    }

    @Transactional
    public void updatePart(Part part) {
        partDao.updateBook(part);
    }

    @Transactional
    public void removePart(int id) {
        partDao.removePart(id);
    }

    @Transactional
    public long getPositionsQuantity() {
        return partDao.getPositionsQuantity();
    }

    @Transactional
    public List<Part> getPaginatedParts(int page, int maxResults) {
        return partDao.getPaginatedParts(maxResults * (page - 1), maxResults);
    }

    @Transactional
    public Part getPartById(int id) {
        return partDao.getPartById(id);
    }

    @Transactional
    public List<Part> findAllPartsByName(String name) {
        return partDao.findAllPartsByName(name);
    }

    @Transactional
    public int canAssembleAmount() {
        return partDao.canAssembleAmount();
    }

    @Transactional
    public List<Part> getRequireParts() {
        return partDao.getRequireParts();
    }
}
