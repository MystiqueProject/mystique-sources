	p?h???@p?h???@!p?h???@	F???l\@F???l\@!F???l\@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6p?h???@&?5?P??1??	ܺ??AOϻ??0??I?`p??@Y(Hlwн?*	?n???R@2F
Iterator::Model8fٓ????!?1UK@)?!??g??1??adGE@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??e?O7??!ؤ??Q5@)????????1gv&?0@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap@?:s	??!?@?o 4@)?q4GV~??1?1? b?0@:Preprocessing2U
Iterator::Model::ParallelMapV2z?ަ????!?}}R'@)z?ަ????1?}}R'@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip??bE???!|?????F@)?"??l?1?????|@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?W?\Tk?!?!. ?@)?W?\Tk?1?!. ?@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice a??*f?!_޾?m?@) a??*f?1_޾?m?@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 13.6% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?68.5 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9F???l\@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	&?5?P??&?5?P??!&?5?P??      ??!       "	??	ܺ????	ܺ??!??	ܺ??*      ??!       2	Oϻ??0??Oϻ??0??!Oϻ??0??:	?`p??@?`p??@!?`p??@B      ??!       J	(Hlwн?(Hlwн?!(Hlwн?R      ??!       Z	(Hlwн?(Hlwн?!(Hlwн?JGPUYF???l\@b 