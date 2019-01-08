package com.example.warehouse.model;

import javax.persistence.*;

@Entity
@Table(name = "PARTS")
public class Part {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "PARTS_NAME")
    private String partName;

    @Column(name = "PARTS_REQUIRE")
    private boolean require;

    @Column(name = "PARTS_QUANTITY")
    private int quantity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public boolean isRequire() {
        return require;
    }

    public void setRequire(boolean require) {
        this.require = require;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Part{" +
                "id=" + id +
                ", partName='" + partName + '\'' +
                ", require=" + require +
                ", quantity=" + quantity +
                '}';
    }
}
