	MHk:1@MHk:1@!MHk:1@	?M%??@?M%??@!?M%??@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6MHk:1@F??\???1I?\߇???A??E??\??Iv?Kp?#
@Y??K??$??*	?S㥛?X@2F
Iterator::ModelCV????! ???E?C@)c~nh?N??1??"=?>@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate??p>???!??c??;@)S?u8?J??1??x???6@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatl?f?ܖ?!?,5?G?6@)?Ϲ????1_?W??2@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip???vî?! yp?\N@)3???yS??1??ŝ!@:Preprocessing2U
Iterator::Model::ParallelMapV2V??L???!C?Qx?? @)V??L???1C?Qx?? @:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice???+?s?!???mޏ@)???+?s?1???mޏ@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor.s?,&6o?!?ā1??@).s?,&6o?1?ā1??@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap
?8?? ??!F?À]?=@)??|	\?1c?y?A???:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 12.5% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?71.8 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9?M%??@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	F??\???F??\???!F??\???      ??!       "	I?\߇???I?\߇???!I?\߇???*      ??!       2	??E??\????E??\??!??E??\??:	v?Kp?#
@v?Kp?#
@!v?Kp?#
@B      ??!       J	??K??$????K??$??!??K??$??R      ??!       Z	??K??$????K??$??!??K??$??JGPUY?M%??@b 