resource "aws_key_pair" "my_instance_key_pair" {
    key_name = "terraform_learning_key_1"
    public_key = file("./id_xrsa.pub")
}
