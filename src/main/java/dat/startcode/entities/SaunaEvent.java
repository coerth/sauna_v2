package dat.startcode.entities;

import java.util.Objects;

public class SaunaEvent {

    int eventID;
    String startTime;
    int duration;
    int price;
    int participants;
    String address;

    public SaunaEvent(int eventID, String startTime, int duration, int price, int participants, String address) {
        this.eventID = eventID;
        this.startTime = startTime;
        this.duration = duration;
        this.price = price;
        this.participants = participants;
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof SaunaEvent)) return false;
        SaunaEvent that = (SaunaEvent) o;
        return getEventID() == that.getEventID() && getDuration() == that.getDuration() && getPrice() == that.getPrice() && getParticipants() == that.getParticipants() && getStartTime().equals(that.getStartTime()) && getAddress().equals(that.getAddress());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getEventID(), getStartTime(), getDuration(), getPrice(), getParticipants(), getAddress());
    }

    public int getEventID() {
        return eventID;
    }

    public String getStartTime() {
        return startTime;
    }

    public int getDuration() {
        return duration;
    }

    public int getPrice() {
        return price;
    }

    public int getParticipants() {
        return participants;
    }

    public String getAddress() {
        return address;
    }
}
