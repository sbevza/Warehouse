package com.example.warehouse.dao;

import com.example.warehouse.model.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

@Repository
public class PartDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addBook(Part part) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(part);
    }

    public void updateBook(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(part);
    }

    public Part getPartById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(Part.class, new Integer(id));
    }

    public void removePart(int id) {
        Session session = sessionFactory.getCurrentSession();
        Part book = (Part) session.load(Part.class, new Integer(id));

        if (book != null) {
            session.delete(book);
        }
    }

    public int canAssembleAmount() {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("from Part where require = true order by quantity").setMaxResults(1);
        List<Part> parts = ((org.hibernate.query.Query) query).list();
        return parts.get(0).getQuantity();
    }

    public List<Part> findAllPartsByName(String name) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("from Part where partName like :name");
        query.setParameter("name", "%" + name + "%");
        return ((org.hibernate.query.Query) query).list();
    }

    public long getPositionsQuantity() {
        Session session = sessionFactory.getCurrentSession();
        List l = session.createQuery("select count (distinct id) from Part").list();
        return (long) l.get(0);
    }

    public List<Part> getRequireParts() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Part where require = true");
        return  ((org.hibernate.query.Query) query).list();
    }

    @SuppressWarnings("unchecked")
    public List<Part> getPaginatedParts(int firstResult, int maxResults) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("from Part");
        query.setFirstResult(firstResult);
        query.setMaxResults(maxResults);
        return  ((org.hibernate.query.Query) query).list();
    }

    @SuppressWarnings("unchecked")
    public List<Part> getAllParts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Part").list();
    }
}
