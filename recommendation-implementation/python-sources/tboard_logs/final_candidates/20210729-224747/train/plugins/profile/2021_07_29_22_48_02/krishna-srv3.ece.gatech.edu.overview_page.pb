?	????;???????;???!????;???	??]?E
@??]?E
@!??]?E
@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:????;???rl=C8f??A?52;???Y?͎T????rEagerKernelExecute 0*	??Q??U@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap<?2T?T??!? W??=@)??$xC??1?a?h??7@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat?;??bF??!??χ?;@))r?#??1????6@:Preprocessing2U
Iterator::Model::ParallelMapV2E?^Ӄ???!]j)?3?4@)E?^Ӄ???1]j)?3?4@:Preprocessing2F
Iterator::Model????!%?*>??B@)D??]L3??1??,??0@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice??6p?t?!??&?I?@)??6p?t?1??&?I?@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip^I?\߇??!?	??]9O@)AG?Z?q?1urh6@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorUܸ???p?!D-? @)Uܸ???p?1D-? @:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
device?Your program is NOT input-bound because only 3.3% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.no*no9??]?E
@I?0=?-X@Zno#You may skip the rest of this page.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	rl=C8f??rl=C8f??!rl=C8f??      ??!       "      ??!       *      ??!       2	?52;????52;???!?52;???:      ??!       B      ??!       J	?͎T?????͎T????!?͎T????R      ??!       Z	?͎T?????͎T????!?͎T????b      ??!       JCPU_ONLYY??]?E
@b q?0=?-X@Y      Y@q??ImP??"?
device?Your program is NOT input-bound because only 3.3% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.b
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