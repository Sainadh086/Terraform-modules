resources "aws_eks_node" {
    cluster_name = "${aws_eks_cluster.test.name}"
    node_role    = "${aws_iam_role.node.arn}"
    node_type    = "t2.medium"
    subnet_ids   = ["${aws_subnet.test[0].id}", "${aws_subnet.test[1].id}"]
    count        = 1
    ami          = "${data.aws_ami.amzn-2.0.amzn-2.0.x86_64-gp2.id}"
    tags         = {
      "Name" = "test-node"
    }
}