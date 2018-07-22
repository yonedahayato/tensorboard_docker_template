import tensorflow as tf

a = tf.constant(10, name="a")
b = tf.constant(32, name="b")

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    sess.run(a + b)
    summary_writer = tf.summary.FileWriter("tensorboard_log", graph=sess.graph)
