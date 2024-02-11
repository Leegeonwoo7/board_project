package bean;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberDTO {
    private String name;
    private String id;
    private String password;
    private String gender;
    private String email;
    private String phone;
    private String addressCode;
    private String addressAddress;
    private String addressAddressDetail;
}
