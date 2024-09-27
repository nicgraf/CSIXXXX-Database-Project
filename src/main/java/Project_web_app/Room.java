package Project_web_app;

/*
 * Class that holds information related to a given Room
 *
 * Nic Graf 2024 for CSI2132
 */
public class Room {

    private int room_number;
    private String chain_name;
    private int hotel_ID;
    private int price;
    private String city;
    private int star_rating;
    private boolean tv;
    private boolean ac;
    private boolean fridge;
    private boolean wifi;
    private String view;
    private int capacity;
    private boolean extendable;

    public Room(){
        this.room_number = 0;
        this.chain_name = null;
        this.price = 0;
        this.city = null;
        this.star_rating = 0;
        this.tv = false;
        this.ac = false;
        this.fridge = false;
        this.wifi = false;
        this.view = null;
        this.capacity = 0;
        this.extendable = false;

    }
    public Room(int room_number, String chain_name, int hotel_ID, int price, String city, int star_rating, boolean tv, boolean ac,
                boolean fridge, boolean wifi, String view, int capacity, boolean extendable) {
        this.room_number = room_number;
        this.hotel_ID = hotel_ID;
        this.chain_name = chain_name;
        this.price = price;
        this.city = city;
        this.star_rating = star_rating;
        this.tv = tv;
        this.ac = ac;
        this.fridge = fridge;
        this.wifi = wifi;
        this.view = view;
        this.capacity = capacity;
        this.extendable = extendable;
    }
    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public String getChain_name() {
        return chain_name;
    }

    public void setChain_name(String chain_name) {
        this.chain_name = chain_name;
    }
    public int getHotel_ID() {return hotel_ID;}
    public void setHotel_ID(int hotel_ID){this.hotel_ID = hotel_ID;}
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getStar_rating() {
        return star_rating;
    }

    public void setStar_rating(int star_rating) {
        this.star_rating = star_rating;
    }

    public boolean isTv() {
        return tv;
    }

    public void setTv(boolean tv) {
        this.tv = tv;
    }

    public boolean isAc() {
        return ac;
    }

    public void setAc(boolean ac) {
        this.ac = ac;
    }

    public boolean isFridge() {
        return fridge;
    }

    public void setFridge(boolean fridge) {
        this.fridge = fridge;
    }

    public boolean isWifi() {
        return wifi;
    }

    public void setWifi(boolean wifi) {
        this.wifi = wifi;
    }

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public boolean isExtendable() {
        return extendable;
    }

    public void setExtendable(boolean extendable) {
        this.extendable = extendable;
    }

    @Override
    public String toString() {
        return "Room{" +
                "room_number=" + room_number +
                ", chain_name='" + chain_name + '\'' +
                ", hotel_ID='" + hotel_ID + '\'' +
                ", price=" + price +
                ", city='" + city + '\'' +
                ", star_rating=" + star_rating +
                ", tv=" + tv +
                ", ac=" + ac +
                ", fridge=" + fridge +
                ", wifi=" + wifi +
                ", view='" + view + '\'' +
                ", capacity=" + capacity +
                ", extendable=" + extendable +
                '}';
    }


}
