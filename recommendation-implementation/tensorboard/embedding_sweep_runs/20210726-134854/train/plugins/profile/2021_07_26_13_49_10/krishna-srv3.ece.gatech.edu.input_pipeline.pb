	???(yu?????(yu??!???(yu??	(??I?@(??I?@!(??I?@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:???(yu?? ?H? ??AƦ?B ???Y`??-ʬ?rEagerKernelExecute 0*	o????T@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat?5Z?P??!Ik?C???@)2???j??1.jޚ*:@:Preprocessing2U
Iterator::Model::ParallelMapV2Gsd嗑?!!???Չ4@)Gsd嗑?1!???Չ4@:Preprocessing2F
Iterator::Model?/???h??!??D<?'C@)D0.s??1?????1@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap??B=}??!??E?F?7@)?	?y???1n????G1@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice]?P??v?!+^i?s?@)]?P??v?1+^i?s?@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zipb????k??!o1???N@)x{?%t?1q곅^?@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??"???s?!k????@)??"???s?1k????@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
device?Your program is NOT input-bound because only 3.0% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.no*no9(??I?@I?`??BX@Zno#You may skip the rest of this page.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	 ?H? ?? ?H? ??! ?H? ??      ??!       "      ??!       *      ??!       2	Ʀ?B ???Ʀ?B ???!Ʀ?B ???:      ??!       B      ??!       J	`??-ʬ?`??-ʬ?!`??-ʬ?R      ??!       Z	`??-ʬ?`??-ʬ?!`??-ʬ?b      ??!       JCPU_ONLYY(??I?@b q?`??BX@