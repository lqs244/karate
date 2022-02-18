package tesat1;

import java.util.HashMap;
import java.util.Map;

public class tool {
    private static final Map<String,Object> map = new HashMap<String,Object>();
    public void __set(String name,Object value){
//        System.out.println("111111111111111"+value.getClass().getName());
        map.put(name,value);
    }
    public Object __get(String name){
        return map.get(name);
    }

}