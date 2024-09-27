package Project_web_app;
/*
 * Class that holds information related to a given hotel employee
 *
 * Nic Graf 2024 for CSI2132
 */
public class Hotel_Employee {

    private String chain_name;
    private int hotel_ID;
    private String first_name;
    private String last_name;
    private String title;
    private String email_address;
    private int phone_number;

    public String getChain_name() {
        return chain_name;
    }
    public void setChain_name(String chain_name) {
        this.chain_name = chain_name;
    }
    public int getHotel_ID() {
        return hotel_ID;
    }
    public void setHotel_ID(int hotel_ID) {
        this.hotel_ID = hotel_ID;
    }
    public String getFirst_name() {
        return first_name;
    }
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }
    public String getLast_name() {
        return last_name;
    }
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getEmail_address() {
        return email_address;
    }
    public void setEmail_address(String email_address) {
        this.email_address = email_address;
    }
    public int getPhone_number() {
        return phone_number;
    }
    public void setPhone_number(int phone_number) {
        this.phone_number = phone_number;
    }
}
