?	r??rgf??r??rgf??!r??rgf??	9m???,	@9m???,	@!9m???,	@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:r??rgf????x!??AFzQ????Y9^??I???rEagerKernelExecute 0*	X9??~S@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatWya???!??0???>@)???Փ?1??????8@:Preprocessing2U
Iterator::Model::ParallelMapV2DOʤ?6??!r ???M4@)DOʤ?6??1r ???M4@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap@??????!???Y??8@)???u6???1?6K5?3@:Preprocessing2F
Iterator::Model@N?0????!S?
>?B@)???'???13Dm,??0@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip5S"??!?M???yO@)??,??v?1??S??@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??A?Fs?!!(@}?#@)??A?Fs?1!(@}?#@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSliceF?T?=?o?!8????@)F?T?=?o?18????@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 5.7% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).no*no9:m???,	@I??k??6X@Zno>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	??x!????x!??!??x!??      ??!       "      ??!       *      ??!       2	FzQ????FzQ????!FzQ????:      ??!       B      ??!       J	9^??I???9^??I???!9^??I???R      ??!       Z	9^??I???9^??I???!9^??I???b      ??!       JCPU_ONLYY:m???,	@b q??k??6X@Y      Y@q??4???"?
both?Your program is POTENTIALLY input-bound because 5.7% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
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