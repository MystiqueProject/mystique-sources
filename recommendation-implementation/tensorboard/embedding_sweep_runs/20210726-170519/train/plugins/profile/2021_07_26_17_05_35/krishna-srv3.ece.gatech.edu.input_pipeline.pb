	Ĳ?CR??Ĳ?CR??!Ĳ?CR??	???? ?@???? ?@!???? ?@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:Ĳ?CR???e?I)???A?Yf????Y???????rEagerKernelExecute 0*	???QxS@2U
Iterator::Model::ParallelMapV2?B?????!QH.??6:@)?B?????1QH.??6:@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat???_???!i3{??;@)?x"??p??1Vv4??7@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?}??ϕ?!??\??Y;@)?)H4??1]S򷫒5@:Preprocessing2F
Iterator::Model??=$|???!*????D@)?3?%??1?-??+@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice;?O??nr?!^???@);?O??nr?1^???@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipR}?%???!?s`??M@)I?s
??q?1@????2@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor-???ai?!??5?xq@)-???ai?1??5?xq@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 3.1% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).no*no9???? ?@I;?8?oX@Zno>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	?e?I)????e?I)???!?e?I)???      ??!       "      ??!       *      ??!       2	?Yf?????Yf????!?Yf????:      ??!       B      ??!       J	??????????????!???????R      ??!       Z	??????????????!???????b      ??!       JCPU_ONLYY???? ?@b q;?8?oX@