package dat.startcode.persistence;

import dat.startcode.entities.SaunaEvent;
import dat.startcode.exceptions.DatabaseException;

import java.util.ArrayList;
import java.util.List;

public interface IEventMapper {

    public ArrayList<SaunaEvent> getAllEvents() throws DatabaseException;


}
