	?-?\o[???-?\o[??!?-?\o[??	???X?@???X?@!???X?@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:?-?\o[????t???A???????YC???}??rEagerKernelExecute 0*	z?&1S@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatP?Y??/??!?<??ЬB@)??i??ј?1ӻ?????@:Preprocessing2U
Iterator::Model::ParallelMapV2!O!W???!??????0@)!O!W???1??????0@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::ConcatenateMjh???!???T?5@)'??b??1Z?;?-@:Preprocessing2F
Iterator::Model?$>w????!ħ?b+?>@)?D-ͭ??1qZ??<,@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip??"???!VZ'5SQ@)u ???Ww?1EoǍ(?@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice??}???u?!?-?@)??}???u?1?-?@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?z??9yq?!]??qL\@)?z??9yq?1]??qL\@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?????!??!@??h{8@)?St$??`?1?????@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 9.8% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).no*no9???X?@I??p???W@Zno>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	??t?????t???!??t???      ??!       "      ??!       *      ??!       2	??????????????!???????:      ??!       B      ??!       J	C???}??C???}??!C???}??R      ??!       Z	C???}??C???}??!C???}??b      ??!       JCPU_ONLYY???X?@b q??p???W@