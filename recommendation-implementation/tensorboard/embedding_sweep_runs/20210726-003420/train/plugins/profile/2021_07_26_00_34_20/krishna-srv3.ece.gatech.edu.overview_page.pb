?	???e???????e????!???e????	?!???@?!???@!?!???@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:???e????G 7???AQL? 3???Yp??:ǀ??rEagerKernelExecute 0*	?&1??W@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat?ص?ݒ??!U???O=@)???U-???1qCK
ڍ9@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip^??I?԰?!???CQ@)]??a??1_y?"ǂ0@:Preprocessing2U
Iterator::Model::ParallelMapV2ޫV&?R??!;?0@)ޫV&?R??1;?0@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate?W?????!3j?ԍ5@)	S?K???1G
M??.@:Preprocessing2F
Iterator::Model??z0)??!?c?ۑ?>@)mq??d???1?????-@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice$?????w?!=(???y@)$?????w?1=(???y@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor???@?Mm?!&??q8@)???@?Mm?1&??q8@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap??J&???!?c???<7@)???$xCZ?1AI????:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 10.4% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).no*no9?!???@I???8hX@Zno>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	G 7???G 7???!G 7???      ??!       "      ??!       *      ??!       2	QL? 3???QL? 3???!QL? 3???:      ??!       B      ??!       J	p??:ǀ??p??:ǀ??!p??:ǀ??R      ??!       Z	p??:ǀ??p??:ǀ??!p??:ǀ??b      ??!       JCPU_ONLYY?!???@b q???8hX@Y      Y@qi??M_d??"?
both?Your program is POTENTIALLY input-bound because 10.4% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)Q
Otf_data_bottleneck_analysis (find the bottleneck in the tf.data input pipeline)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2M
=type.googleapis.com/tensorflow.profiler.GenericRecommendation
nono2no:
Refer to the TF2 Profiler FAQ2"CPU: B 