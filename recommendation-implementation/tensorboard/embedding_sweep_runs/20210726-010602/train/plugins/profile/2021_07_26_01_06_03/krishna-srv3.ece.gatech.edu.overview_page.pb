?	??g͏? @??g͏? @!??g͏? @	N?T?T`	@N?T?T`	@!N?T?T`	@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:??g͏? @s??c?ȴ?AϺFˁ???Y?yȔA??rEagerKernelExecute 0*	???Q?R@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??(]???!';4?@)_|?/???1Ǡ[Sg9@:Preprocessing2U
Iterator::Model::ParallelMapV2(??&2s??!??????6@)(??&2s??1??????6@:Preprocessing2F
Iterator::Model??l??p??!??UD@)?mR?X???1H:zr2@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate(-\Va3??!ؔ???4@)Mg'?????1?|???P,@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice?!S>u?!?Y闫.@)?!S>u?1?Y闫.@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?'?Xq?!??-??o@)?'?Xq?1??-??o@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip3??(???!?}V???M@)F?T?=?o?1R??v!?@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?WuV???!?L?[.7@)7????[?1?????@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 3.8% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).no*no9O?T?T`	@I?X%X?4X@Zno>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	s??c?ȴ?s??c?ȴ?!s??c?ȴ?      ??!       "      ??!       *      ??!       2	ϺFˁ???ϺFˁ???!ϺFˁ???:      ??!       B      ??!       J	?yȔA???yȔA??!?yȔA??R      ??!       Z	?yȔA???yȔA??!?yȔA??b      ??!       JCPU_ONLYYO?T?T`	@b q?X%X?4X@Y      Y@q??x?z??"?
both?Your program is POTENTIALLY input-bound because 3.8% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
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