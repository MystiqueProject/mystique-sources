	.Ȗ???@.Ȗ???@!.Ȗ???@	
)?B@
)?B@!
)?B@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6.Ȗ???@??u????1??Bs?F??A???\????I?}͑@Y?V?????*	?G?z?[@2F
Iterator::ModelLP÷?n??!?O??
B@)p??????1??̿?;@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?M)??Н?!??"ʡS:@)?s??o??1CU?:?5@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat?-?\o???!?;/??6@)?đ"???1???#2@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip?:8؛??!°?qB?O@)pUj???1??? ??-@:Preprocessing2U
Iterator::Model::ParallelMapV2P?Lۿ???!)uø?? @)P?Lۿ???1)uø?? @:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice?g?RD?u?!@?6כ@)?g?RD?u?1@?6כ@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?uT5At?!??:Z??@)?uT5At?1??:Z??@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 11.9% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?72.1 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9	)?B@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	??u??????u????!??u????      ??!       "	??Bs?F????Bs?F??!??Bs?F??*      ??!       2	???\???????\????!???\????:	?}͑@?}͑@!?}͑@B      ??!       J	?V??????V?????!?V?????R      ??!       Z	?V??????V?????!?V?????JGPUY	)?B@b 