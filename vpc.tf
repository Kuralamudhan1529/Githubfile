resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block

  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24" 
  availability_zone = "us-east-1a"  

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"  
  availability_zone = "us-east-1b"  

  tags = {
    Name = "PrivateSubnet"
  }
}
