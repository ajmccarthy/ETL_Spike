insert /*+ append parallel(4) */
  into result_swap_storet (data_source_id, data_source, station_id, site_id, event_date, analytical_method, activity,
                           characteristic_name, characteristic_type, sample_media, organization, site_type, huc, governmental_unit_code,
                           organization_name, activity_id, activity_type_code, activity_media_subdiv_name, activity_start_time,
                           act_start_time_zone, activity_stop_date, activity_stop_time, act_stop_time_zone, activity_relative_depth_name, activity_depth,
                           activity_depth_unit, activity_depth_ref_point, activity_upper_depth, activity_upper_depth_unit,
                           activity_lower_depth, activity_lower_depth_unit, project_id, activity_conducting_org, activity_comment,
                           activity_latitude, activity_longitude, activity_source_map_scale, act_horizontal_accuracy, act_horizontal_accuracy_unit,
                           act_horizontal_collect_method, act_horizontal_datum_name, assemblage_sampled_name, act_collection_duration, act_collection_duration_unit,
                           act_sam_compnt_name, act_sam_compnt_place_in_series, act_reach_length, act_reach_length_unit, act_reach_width, act_reach_width_unit,
                           act_pass_count, net_type_name, act_net_surface_area, act_net_surface_area_unit, act_net_mesh_size, act_net_mesh_size_unit, act_boat_speed,
                           act_boat_speed_unit, act_current_speed, act_current_speed_unit, toxicity_test_type_name,
                           sample_collect_method_id, sample_collect_method_ctx, sample_collect_method_name,
                           act_sam_collect_meth_qual_type, act_sam_collect_meth_desc, sample_collect_equip_name, act_sam_collect_equip_comments, act_sam_prep_meth_id,
                           act_sam_prep_meth_context, act_sam_prep_meth_name, act_sam_prep_meth_qual_type, act_sam_prep_meth_desc, sample_container_type,
                           sample_container_color, act_sam_chemical_preservative, thermal_preservative_name, act_sam_transport_storage_desc,
                           result_id, res_data_logger_line, result_detection_condition_tx, method_specification_name, sample_fraction_type, result_measure_value,
                           result_unit, result_meas_qual_code, result_value_status, statistic_type, result_value_type, weight_basis_type, duration_basis,
                           temperature_basis_level, particle_size, precision, res_measure_bias, res_measure_conf_interval, res_measure_upper_conf_limit,
                           res_measure_lower_conf_limit, result_comment, result_depth_meas_value, result_depth_meas_unit_code, result_depth_alt_ref_pt_txt,
                           res_sampling_point_name, biological_intent, res_bio_individual_id, sample_tissue_taxonomic_name, unidentifiedspeciesidentifier,
                           sample_tissue_anatomy_name, res_group_summary_ct_wt, res_group_summary_ct_wt_unit, cell_form_name, cell_shape_name, habit_name, volt_name,
                           rtdet_pollution_tolerance, rtdet_pollution_tolernce_scale, rtdet_trophic_level, rtfgrp_functional_feeding_grp, taxon_citation_title,
                           taxon_citation_creator, taxon_citation_subject, taxon_citation_publisher, taxon_citation_date, taxon_citation_id, fcdsc_name,
                           frequency_class_unit, fcdsc_lower_bound, fcdsc_upper_bound, analytical_procedure_id, analytical_procedure_source, analytical_method_name,
                           anlmth_qual_type, analytical_method_citation, lab_name, analysis_start_date, analysis_start_time, analysis_start_timezone, analysis_end_date,
                           analysis_end_time, analysis_end_timezone, rlcom_cd, lab_remark, detection_limit, detection_limit_unit, detection_limit_desc,
                           res_lab_accred_yn, res_lab_accred_authority, res_taxonomist_accred_yn, res_taxonomist_accred_authorty, prep_method_id, prep_method_context,
                           prep_method_name, prep_method_qual_type, prep_method_desc, analysis_prep_date_tx, prep_start_time, prep_start_timezone, prep_end_date,
                           prep_end_time, prep_end_timezone, prep_dilution_factor, project_name, monitoring_location_name, result_object_name, result_object_type,
                           result_file_url, last_updated, res_detect_qnt_lmt_url, lab_sample_prep_url, frequency_class_code_1, frequency_class_code_2, frequency_class_code_3,
                           frequency_class_unit_1, frequency_class_unit_2, frequency_class_unit_3, frequency_class_lower_bound_1, frequency_class_lower_bound_2,
                           frequency_class_lower_bound_3, frequency_class_upper_bound_1, frequency_class_upper_bound_2, frequency_class_upper_bound_3)
select /*+ parallel(4) */
       activity_swap_storet.data_source_id,
       activity_swap_storet.data_source,
       activity_swap_storet.station_id, 
       activity_swap_storet.site_id,
       activity_swap_storet.event_date,
       wqx_analytical_method.nemi_url analytical_method,
       activity_swap_storet.activity,
       characteristic.chr_name characteristic_name,
       nvl(di_characteristic.characteristic_group_type, 'Not Assigned') characteristic_type,
       activity_swap_storet.sample_media,
       activity_swap_storet.organization,
       activity_swap_storet.site_type,
       activity_swap_storet.huc,
       activity_swap_storet.governmental_unit_code,
       activity_swap_storet.organization_name,
       activity_swap_storet.activity_id,
       activity_swap_storet.activity_type_code,
       activity_swap_storet.activity_media_subdiv_name,
       activity_swap_storet.activity_start_time,
       activity_swap_storet.act_start_time_zone,
       activity_swap_storet.activity_stop_date,
       activity_swap_storet.activity_stop_time,
       activity_swap_storet.act_stop_time_zone,
       activity_swap_storet.activity_relative_depth_name,
       activity_swap_storet.activity_depth,
       activity_swap_storet.activity_depth_unit,
       activity_swap_storet.activity_depth_ref_point,
       activity_swap_storet.activity_upper_depth,
       activity_swap_storet.activity_upper_depth_unit,
       activity_swap_storet.activity_lower_depth,
       activity_swap_storet.activity_lower_depth_unit,
       activity_swap_storet.project_id,
       activity_swap_storet.activity_conducting_org,
       activity_swap_storet.activity_comment,
       activity_swap_storet.activity_latitude,
       activity_swap_storet.activity_longitude,
       activity_swap_storet.activity_source_map_scale,
       activity_swap_storet.act_horizontal_accuracy,
       activity_swap_storet.act_horizontal_accuracy_unit,
       activity_swap_storet.act_horizontal_collect_method,
       activity_swap_storet.act_horizontal_datum_name,
       activity_swap_storet.assemblage_sampled_name,
       activity_swap_storet.act_collection_duration,
       activity_swap_storet.act_collection_duration_unit,
       activity_swap_storet.act_sam_compnt_name,
       activity_swap_storet.act_sam_compnt_place_in_series,
       activity_swap_storet.act_reach_length,
       activity_swap_storet.act_reach_length_unit,
       activity_swap_storet.act_reach_width,
       activity_swap_storet.act_reach_width_unit,
       activity_swap_storet.act_pass_count,
       activity_swap_storet.net_type_name,
       activity_swap_storet.act_net_surface_area,
       activity_swap_storet.act_net_surface_area_unit,
       activity_swap_storet.act_net_mesh_size,
       activity_swap_storet.act_net_mesh_size_unit,
       activity_swap_storet.act_boat_speed,
       activity_swap_storet.act_boat_speed_unit,
       activity_swap_storet.act_current_speed,
       activity_swap_storet.act_current_speed_unit,
       activity_swap_storet.toxicity_test_type_name,
       activity_swap_storet.sample_collect_method_id,
       activity_swap_storet.sample_collect_method_ctx,
       activity_swap_storet.sample_collect_method_name,
       activity_swap_storet.act_sam_collect_meth_qual_type,
       activity_swap_storet.act_sam_collect_meth_desc,
       activity_swap_storet.sample_collect_equip_name,
       activity_swap_storet.act_sam_collect_equip_comments,
       activity_swap_storet.act_sam_prep_meth_id,
       activity_swap_storet.act_sam_prep_meth_context,
       activity_swap_storet.act_sam_prep_meth_name,
       activity_swap_storet.act_sam_prep_meth_qual_type,
       activity_swap_storet.act_sam_prep_meth_desc,
       activity_swap_storet.sample_container_type,
       activity_swap_storet.sample_container_color,
       activity_swap_storet.act_sam_chemical_preservative,
       activity_swap_storet.thermal_preservative_name,
       activity_swap_storet.act_sam_transport_storage_desc,
       result.res_uid result_id,
       result.res_data_logger_line,
       result_detection_condition.rdcnd_name result_detection_condition_tx,
       method_speciation.mthspc_name method_specification_name,
       sample_fraction.smfrc_name sample_fraction_type,
       result.res_measure result_measure_value,
       rmeasurement_unit.msunt_cd result_unit,
       result_measure_qualifier.rmqlf_cd result_meas_qual_code,
       result_status.ressta_name result_value_status,
       result_statistical_base.rsbas_cd statistic_type,
       result_value_type.rvtyp_name result_value_type,
       result_weight_basis.rwbas_name weight_basis_type,
       result_time_basis.rtimb_name duration_basis,
       result_temperature_basis.rtmpb_name temperature_basis_level,
       result.res_particle_size_basis particle_size,
       result.res_measure_precision precision,
       result.res_measure_bias,
       result.res_measure_conf_interval,
       result.res_measure_upper_conf_limit,
       result.res_measure_lower_conf_limit,
       result.res_comments result_comment,
       result.res_depth_height result_depth_meas_value,
       dhmeasurement_unit.msunt_cd result_depth_meas_unit_code,
       result.res_depth_altitude_ref_point result_depth_alt_ref_pt_txt,
       result.res_sampling_point_name,
       biological_intent.bioint_name biological_intent,
       result.res_bio_individual_id,
       taxon.tax_name sample_tissue_taxonomic_name,
       result.res_species_id UnidentifiedSpeciesIdentifier,
       sample_tissue_anatomy.stant_name sample_tissue_anatomy_name,
       result.res_group_summary_ct_wt,
       group_summ_ct_wt.msunt_cd res_group_summary_ct_wt_unit,
       cell_form.celfrm_name cell_form_name,
       cell_shape.celshp_name cell_shape_name,
       wqx_result_taxon_habit.habit_name_list habit_name,
       voltinism.volt_name,
       result_taxon_detail.rtdet_pollution_tolerance,
       result_taxon_detail.rtdet_pollution_tolernce_scale,
       result_taxon_detail.rtdet_trophic_level,
       wqx_result_taxon_feeding_group.feeding_group_list rtfgrp_functional_feeding_grp,
       taxon_citation.citatn_title,
       taxon_citation.citatn_creator,
       taxon_citation.citatn_subject,
       taxon_citation.citatn_publisher,
       taxon_citation.citatn_date,
       taxon_citation.citatn_id,
       /* FrequencyClassInformation 0-3 of these per BiologicalResultDescription*/
       /*frequency_class_descriptor.*/ null fcdsc_name,
       /*result_frequency.msunt_cd*/ null frequency_class_unit,
       /*result_frequency_class.*/ null fcdsc_lower_bound,
       /*result_frequency_class.*/ null fcdsc_upper_bound,
       wqx_analytical_method.anlmth_id analytical_procedure_id,
       wqx_analytical_method.amctx_cd analytical_procedure_source,
       wqx_analytical_method.anlmth_name analytical_method_name,
       wqx_analytical_method.anlmth_qual_type,
       wqx_analytical_method.anlmth_url analytical_method_citation,
       result.res_lab_name lab_name,
       to_char(result.res_lab_analysis_start_date, 'yyyy-mm-dd') analysis_start_date,
       result.res_lab_analysis_start_time,
       analysis_start.tmzone_cd analysis_start_timezone,
       result.res_lab_analysis_end_date,
       result.res_lab_analysis_end_time,
       analysis_end.tmzone_cd analysis_end_timezone,
       result_lab_comment.rlcom_cd,
       result_lab_comment.rlcom_desc lab_remark,
       wqx_detection_quant_limit.rdqlmt_measure detection_limit,
       wqx_detection_quant_limit.msunt_cd detection_limit_unit,
       wqx_detection_quant_limit.dqltyp_name detection_limit_desc,
       result.res_lab_accred_yn,
       result.res_lab_accred_authority,
       result.res_taxonomist_accred_yn,
       result.res_taxonomist_accred_authorty,
       /* LabSamplePreparation 0-many per result */
       /*result_lab_sample_prep.*/ null rlsprp_method_id,
       /*result_lab_sample_prep.*/ null rlsprp_method_context,
       /*result_lab_sample_prep.*/ null rlsprp_method_name,
       /*result_lab_sample_prep.*/ null rlsprp_method_qual_type,
       /*result_lab_sample_prep.*/ null rlsprp_method_desc,
       /*to_char(result_lab_sample_prep.rlsprp_start_date, 'yyyy-mm-dd')*/ null analysis_prep_date_tx,
       /*result_lab_sample_prep.*/ null rlsprp_start_time,
       /*prep_start.tmzone_cd*/ null prep_start_timezone,
       /*result_lab_sample_prep.*/ null rlsprp_end_date,
       /*result_lab_sample_prep.*/ null rlsprp_end_time,
       /*prep_end.tmzone_cd*/ null prep_end_time,
       /*result_lab_sample_prep.*/ null rlsprp_dilution_factor,
       activity_swap_storet.project_name,
       activity_swap_storet.monitoring_location_name,
       wqx_attached_object_result.result_object_name,
       wqx_attached_object_result.result_object_type,
       case
         when wqx_attached_object_result.ref_uid is null
           then null
         else
           '/organizations/' ||
               pkg_dynamic_list.url_escape(activity_swap_storet.organization, 'true') || '/activities/' ||
               pkg_dynamic_list.url_escape(activity_swap_storet.activity, 'true') || '/results/' ||
               pkg_dynamic_list.url_escape(activity_swap_storet.organization, 'true') || '-' ||
               pkg_dynamic_list.url_escape(result.res_uid, 'true') || '/files'
       end result_file_url,
       result.res_last_change_date last_updated,
       case 
         when wqx_detection_quant_limit.res_uid is null
           then null
         else 
           '/activities/' ||
               pkg_dynamic_list.url_escape(activity_swap_storet.activity, 'true') || '/results/' ||
               pkg_dynamic_list.url_escape(activity_swap_storet.organization, 'true') || '-' ||
               pkg_dynamic_list.url_escape(result.res_uid, 'true') || '/resdetectqntlmts'
       end res_detect_qnt_lmt_url,
       case 
         when wqx_result_lab_sample_prep_sum.res_uid is null
           then null
         else
           null
       end lab_sample_prep_url,
       wqx_result_frequency_class.one_fcdsc_name frequency_class_code_1,
       wqx_result_frequency_class.two_fcdsc_name frequency_class_code_2,
       wqx_result_frequency_class.three_fcdsc_name frequency_class_code_3,
       wqx_result_frequency_class.one_msunt_cd frequency_class_unit_1,
       wqx_result_frequency_class.two_msunt_cd frequency_class_unit_2,
       wqx_result_frequency_class.three_msunt_cd frequency_class_unit_3,
       wqx_result_frequency_class.one_fcdsc_lower_bound frequency_class_lower_bound_1,
       wqx_result_frequency_class.two_fcdsc_lower_bound frequency_class_lower_bound_2,
       wqx_result_frequency_class.three_fcdsc_lower_bound frequency_class_lower_bound_3,
       wqx_result_frequency_class.one_fcdsc_upper_bound frequency_class_upper_bound_1,
       wqx_result_frequency_class.two_fcdsc_upper_bound frequency_class_upper_bound_2,
       wqx_result_frequency_class.three_fcdsc_upper_bound frequency_class_upper_bound_3
  from activity_swap_storet
       join wqx.result
         on activity_swap_storet.activity_id = result.act_uid
       left join wqx.method_speciation
         on result.mthspc_uid = method_speciation.mthspc_uid
       left join wqx.biological_intent
         on result.bioint_uid = biological_intent.bioint_uid
       left join wqx.characteristic
         on result.chr_uid = characteristic.chr_uid
       left join wqx.result_detection_condition
         on result.rdcnd_uid = result_detection_condition.rdcnd_uid
       left join wqx.sample_fraction
         on result.smfrc_uid = sample_fraction.smfrc_uid
       left join wqx.measurement_unit rmeasurement_unit
         on result.msunt_uid_measure = rmeasurement_unit.msunt_uid
       left join wqx.result_measure_qualifier
         on result.rmqlf_uid = result_measure_qualifier.rmqlf_uid
       left join wqx.result_status
         on result.ressta_uid = result_status.ressta_uid
       left join wqx.result_statistical_base
         on result.rsbas_uid = result_statistical_base.rsbas_uid
       left join wqx.result_value_type
         on result.rvtyp_uid = result_value_type.rvtyp_uid
       left join wqx.result_weight_basis
         on result.rwbas_uid = result_weight_basis.rwbas_uid
       left join wqx.result_time_basis
         on result.rtimb_uid = result_time_basis.rtimb_uid
       left join wqx.result_temperature_basis
         on result.rtmpb_uid = result_temperature_basis.rtmpb_uid
       left join wqx.measurement_unit dhmeasurement_unit
         on result.msunt_uid_depth_height = dhmeasurement_unit.msunt_uid
       left join wqx.measurement_unit group_summ_ct_wt
         on result.msunt_uid_group_summary_ct_wt = group_summ_ct_wt.msunt_uid
       left join wqx_analytical_method
         on result.anlmth_uid = wqx_analytical_method.anlmth_uid
       left join wqx_detection_quant_limit
         on result.res_uid = wqx_detection_quant_limit.res_uid
       left join wqx_result_lab_sample_prep_sum
         on result.res_uid = wqx_result_lab_sample_prep_sum.res_uid
       left join wqx.time_zone analysis_start
         on result.tmzone_uid_lab_analysis_start = analysis_start.tmzone_uid
       left join wqx.time_zone analysis_end
         on result.tmzone_uid_lab_analysis_end = analysis_end.tmzone_uid 
       left join wqx.taxon
         on result.tax_uid = taxon.tax_uid
       left join wqx.sample_tissue_anatomy
         on result.stant_uid = sample_tissue_anatomy.stant_uid
       left join wqx.result_lab_comment
         on result.rlcom_uid = result_lab_comment.rlcom_uid
       left join storetw.di_characteristic
         on characteristic.chr_storet_id = di_characteristic.pk_isn
       left join wqx_result_taxon_habit
         on result.res_uid = wqx_result_taxon_habit.res_uid
       left join wqx.result_taxon_detail
         on result.res_uid = result_taxon_detail.res_uid
       left join wqx.voltinism
         on result_taxon_detail.volt_uid = voltinism.volt_uid
       left join wqx_result_taxon_feeding_group
         on result.res_uid = wqx_result_taxon_feeding_group.res_uid
       left join wqx.citation taxon_citation
         on result_taxon_detail.citatn_uid = taxon_citation.citatn_uid
       left join wqx.cell_form
         on result_taxon_detail.celfrm_uid = cell_form.celfrm_uid
       left join wqx.cell_shape
         on result_taxon_detail.celshp_uid = cell_shape.celshp_uid
       left join wqx_attached_object_result
         on result.org_uid = wqx_attached_object_result.org_uid and
            result.res_uid = wqx_attached_object_result.ref_uid
       left join wqx_result_frequency_class
         on result.res_uid = wqx_result_frequency_class.res_uid
 where result.ressta_uid != 4