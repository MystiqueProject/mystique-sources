	\v?ؒ@\v?ؒ@!\v?ؒ@	:?j3[)@:?j3[)@!:?j3[)@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6\v?ؒ@???? ???1?Wt?5???Ai6??`???I5
If?
@Yr?Z|
???*	w??/R@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??aMeQ??!D???j@@)?7i͓?1??/??:@:Preprocessing2F
Iterator::Model?%?????!?W??B@)?e???~??1l?MR:@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate? Ϡ???!????lZ5@)û\?wb??1?U?U?8.@:Preprocessing2U
Iterator::Model::ParallelMapV2????P?|?!?B"?D|#@)????P?|?1?B"?D|#@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip?A$C????!!?PQ??O@)?C??<?v?1_?Jn??@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSliceʉvR~r?!y???@)ʉvR~r?1y???@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorB???Dr?!?%'??d@)B???Dr?1?%'??d@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapc?D(b??!d%?'Jx7@)? ??zY?1?֤v?? @:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 12.1% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?72.6 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9:?j3[)@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	???? ??????? ???!???? ???      ??!       "	?Wt?5????Wt?5???!?Wt?5???*      ??!       2	i6??`???i6??`???!i6??`???:	5
If?
@5
If?
@!5
If?
@B      ??!       J	r?Z|
???r?Z|
???!r?Z|
???R      ??!       Z	r?Z|
???r?Z|
???!r?Z|
???JGPUY:?j3[)@b 