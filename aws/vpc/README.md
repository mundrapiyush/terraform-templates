## Provision Network

1. Create the **VPC**
    - Decide on the IP range to be used for your VPC

2. Create the **Subnets**
    - Each subnet belongs to one availability zone. So in the example one subnet is created in `ap-south-1a` `ap-south-1b` and `ap-south-1c` respectively.
    - Decide on the IP range to be assigned to each of the subnet so that the IP address space is assigned correctly.
    - For the **Public** subnets, make sure to set the `map_public_ip_on_launch` property to `true`
    - For the **Private** subnets, make sure to set the `map_public_ip_on_launch` property to `false`

3. Create the **Internet-Gateway**
    - Create the Internet Gateway for the VPC

4. Enable the private subnets to connect to internet using Internet Gateway
    - Create the **Route-Table** to route all the packets for internet to be routed to Internet-Gateway
        - `cidr_block` of `0.0.0.0/0` specifies that all the packets to be observed.
        - `gateway_id` to be the id of the Internet Gateway created in step-3.
    - Create the **Route-Table-Association** between the **Subnet** and the **Route-Table**

5. Create the **Security-Group** to enable SSH connection
    - Ingress to allow all (`cidr_blocks=0.0.0.0/0`) incoming traffic to port `22` via `to-port` variable
    - Egress to allow all traffic originating from the subnets 

---

## Provision Instance

1. Create the Key-Pair with the public key present in the local directory
2. Create the instance in one of the public subnet provisioned, with the public-key as generated in step-1. Also, attach the security group with ssh-enabled to the instance.
