; ModuleID = 'C:/Users/hongyuc/Desktop/sobel_new-old/xapp890/sobel_rd_prj/solution3/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@sobel_filter_str = internal unnamed_addr constant [13 x i8] c"sobel_filter\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@p_str3 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1

define void @sobel_filter([2073600 x i24]* %inter_pix_V, [2073600 x i24]* %out_pix_V, i32 %rows, i32 %cols) {
ap_linebuffer.exit:
  call void (...)* @_ssdm_op_SpecBitsMap([2073600 x i24]* %inter_pix_V), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([2073600 x i24]* %out_pix_V), !map !14
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %rows), !map !18
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %cols), !map !24
  call void (...)* @_ssdm_op_SpecTopModule([13 x i8]* @sobel_filter_str) nounwind
  %cols_read = call i32 @_ssdm_op_Read.ap_none.i32(i32 %cols)
  %rows_read = call i32 @_ssdm_op_Read.ap_none.i32(i32 %rows)
  %buff_A_M_0 = alloca [1920 x i8], align 1
  %buff_A_M_1 = alloca [1920 x i8], align 1
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %cols, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %rows, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface([2073600 x i24]* %out_pix_V, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecInterface([2073600 x i24]* %inter_pix_V, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  %tmp = add nsw i32 %rows_read, 1
  %tmp_1 = add nsw i32 %cols_read, 1
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader, %ap_linebuffer.exit
  %row = phi i31 [ 0, %ap_linebuffer.exit ], [ %row_1, %.preheader ]
  %row_cast = zext i31 %row to i32
  %tmp_2 = icmp slt i32 %row_cast, %tmp
  %row_1 = add i31 %row, 1
  br i1 %tmp_2, label %.preheader.preheader, label %2

.preheader.preheader:                             ; preds = %.loopexit
  %tmp_3 = icmp slt i32 %row_cast, %rows_read
  %tmp_4 = trunc i31 %row to i11
  %p_shl2_cast = call i22 @_ssdm_op_BitConcatenate.i22.i11.i11(i11 %tmp_4, i11 0)
  %tmp_7 = trunc i31 %row to i15
  %p_shl3_cast = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %tmp_7, i7 0)
  %tmp_13 = sub i22 %p_shl2_cast, %p_shl3_cast
  %tmp_5 = icmp ne i31 %row, 0
  %tmp_6 = add nsw i32 -1, %row_cast
  %tmp_14 = trunc i32 %tmp_6 to i11
  %p_shl_cast = call i22 @_ssdm_op_BitConcatenate.i22.i11.i11(i11 %tmp_14, i11 0)
  %tmp_16 = trunc i32 %tmp_6 to i15
  %p_shl1_cast = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %tmp_16, i7 0)
  %tmp_17 = sub i22 %p_shl_cast, %p_shl1_cast
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge222, %.preheader.preheader
  %ColIndex_assign = phi i31 [ 0, %.preheader.preheader ], [ %col, %._crit_edge222 ]
  %ColIndex_assign_cast = zext i31 %ColIndex_assign to i32
  %tmp_8 = icmp slt i32 %ColIndex_assign_cast, %tmp_1
  %col = add i31 %ColIndex_assign, 1
  br i1 %tmp_8, label %0, label %.loopexit

; <label>:0                                       ; preds = %.preheader
  %tmp_10 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str3)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp_9 = icmp slt i32 %ColIndex_assign_cast, %cols_read
  br i1 %tmp_9, label %shift_up.exit, label %._crit_edge

shift_up.exit:                                    ; preds = %0
  %tmp_s = zext i31 %ColIndex_assign to i64
  %buff_A_M_1_addr = getelementptr [1920 x i8]* %buff_A_M_1, i64 0, i64 %tmp_s
  %buff_A_M_0_addr = getelementptr [1920 x i8]* %buff_A_M_0, i64 0, i64 %tmp_s
  %return_value = load i8* %buff_A_M_0_addr, align 1
  store i8 %return_value, i8* %buff_A_M_1_addr, align 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %shift_up.exit, %0
  %tmp_11 = and i1 %tmp_9, %tmp_3
  br i1 %tmp_11, label %_ZN7ap_uintILi8EEC1ILi32ELi32ELb1EL9ap_q_mode5EL9ap_o_mode3ELi0EEERK13ap_fixed_baseIXT_EXT0_EXT1_EXT2_EXT3_EXT4_EE.exit, label %._crit_edge220

_ZN7ap_uintILi8EEC1ILi32ELi32ELb1EL9ap_q_mode5EL9ap_o_mode3ELi0EEERK13ap_fixed_baseIXT_EXT0_EXT1_EXT2_EXT3_EXT4_EE.exit: ; preds = %._crit_edge
  %tmp_12 = zext i31 %ColIndex_assign to i64
  %tmp_18 = trunc i31 %ColIndex_assign to i22
  %tmp_19 = add i22 %tmp_18, %tmp_13
  %tmp_20_cast = sext i22 %tmp_19 to i64
  %inter_pix_V_addr = getelementptr [2073600 x i24]* %inter_pix_V, i64 0, i64 %tmp_20_cast
  %p_Val2_s = load i24* %inter_pix_V_addr, align 4
  %r_V = trunc i24 %p_Val2_s to i8
  %p_Val2_3 = call i8 @_ssdm_op_PartSelect.i8.i24.i32.i32(i24 %p_Val2_s, i32 8, i32 15)
  %tmp_20 = call i8 @_ssdm_op_PartSelect.i8.i24.i32.i32(i24 %p_Val2_s, i32 16, i32 23)
  %p_shl1_i = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %tmp_20, i6 0)
  %p_shl1_i_cast = zext i14 %p_shl1_i to i15
  %p_shl2_i = call i9 @_ssdm_op_BitConcatenate.i9.i8.i1(i8 %tmp_20, i1 false)
  %p_shl2_i_cast = zext i9 %p_shl2_i to i15
  %tmp_23_i_cast5 = zext i8 %p_Val2_3 to i9
  %p_shl_i = call i15 @_ssdm_op_BitConcatenate.i15.i8.i7(i8 %p_Val2_3, i7 0)
  %p_shl_i_cast = zext i15 %p_shl_i to i16
  %tmp_25_i_cast = zext i8 %r_V to i13
  %tmp_26_i = mul i13 25, %tmp_25_i_cast
  %tmp2 = add i15 %p_shl2_i_cast, %p_shl1_i_cast
  %tmp2_cast = zext i15 %tmp2 to i16
  %tmp1 = add i16 %tmp2_cast, %p_shl_i_cast
  %tmp4 = add i9 128, %tmp_23_i_cast5
  %tmp4_cast = zext i9 %tmp4 to i13
  %tmp3 = add i13 %tmp4_cast, %tmp_26_i
  %tmp3_cast = zext i13 %tmp3 to i16
  %tmp_29_i = add i16 %tmp3_cast, %tmp1
  %tmp_31_i = call i8 @_ssdm_op_PartSelect.i8.i16.i32.i32(i16 %tmp_29_i, i32 8, i32 15)
  %y = add i8 16, %tmp_31_i
  %buff_A_M_0_addr_1 = getelementptr [1920 x i8]* %buff_A_M_0, i64 0, i64 %tmp_12
  store i8 %y, i8* %buff_A_M_0_addr_1, align 1
  br label %._crit_edge220

._crit_edge220:                                   ; preds = %_ZN7ap_uintILi8EEC1ILi32ELi32ELb1EL9ap_q_mode5EL9ap_o_mode3ELi0EEERK13ap_fixed_baseIXT_EXT0_EXT1_EXT2_EXT3_EXT4_EE.exit, %._crit_edge
  %tmp_15 = icmp ne i31 %ColIndex_assign, 0
  %or_cond = and i1 %tmp_5, %tmp_15
  br i1 %or_cond, label %1, label %._crit_edge222

; <label>:1                                       ; preds = %._crit_edge220
  %tmp_21 = trunc i31 %ColIndex_assign to i22
  %tmp_22 = add i22 -1, %tmp_21
  %tmp_23 = add i22 %tmp_17, %tmp_22
  %tmp_24_cast = sext i22 %tmp_23 to i64
  %out_pix_V_addr = getelementptr [2073600 x i24]* %out_pix_V, i64 0, i64 %tmp_24_cast
  store i24 undef, i24* %out_pix_V_addr, align 4
  br label %._crit_edge222

._crit_edge222:                                   ; preds = %1, %._crit_edge220
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str3, i32 %tmp_10)
  br label %.preheader

; <label>:2                                       ; preds = %.loopexit
  ret void
}

declare i24 @llvm.part.select.i24(i24, i32, i32) nounwind readnone

declare i16 @llvm.part.select.i16(i16, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.ap_none.i32(i32) {
entry:
  ret i32 %0
}

define weak i8 @_ssdm_op_PartSelect.i8.i24.i32.i32(i24, i32, i32) nounwind readnone {
entry:
  %empty = call i24 @llvm.part.select.i24(i24 %0, i32 %1, i32 %2)
  %empty_7 = trunc i24 %empty to i8
  ret i8 %empty_7
}

define weak i8 @_ssdm_op_PartSelect.i8.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_8 = trunc i16 %empty to i8
  ret i8 %empty_8
}

declare i22 @_ssdm_op_PartSelect.i22.i31.i32.i32(i31, i32, i32) nounwind readnone

declare i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i15 @_ssdm_op_PartSelect.i15.i31.i32.i32(i31, i32, i32) nounwind readnone

declare i11 @_ssdm_op_PartSelect.i11.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i11 @_ssdm_op_PartSelect.i11.i31.i32.i32(i31, i32, i32) nounwind readnone

declare i16 @_ssdm_op_HSub(...)

declare i16 @_ssdm_op_HMul(...)

declare i16 @_ssdm_op_HDiv(...)

declare i16 @_ssdm_op_HAdd(...)

define weak i9 @_ssdm_op_BitConcatenate.i9.i8.i1(i8, i1) nounwind readnone {
entry:
  %empty = zext i8 %0 to i9
  %empty_9 = zext i1 %1 to i9
  %empty_10 = shl i9 %empty, 1
  %empty_11 = or i9 %empty_10, %empty_9
  ret i9 %empty_11
}

define weak i24 @_ssdm_op_BitConcatenate.i24.i8.i8.i8(i8, i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %1 to i16
  %empty_12 = zext i8 %2 to i16
  %empty_13 = shl i16 %empty, 8
  %empty_14 = or i16 %empty_13, %empty_12
  %empty_15 = zext i8 %0 to i24
  %empty_16 = zext i16 %empty_14 to i24
  %empty_17 = shl i24 %empty_15, 16
  %empty_18 = or i24 %empty_17, %empty_16
  ret i24 %empty_18
}

define weak i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15, i7) nounwind readnone {
entry:
  %empty = zext i15 %0 to i22
  %empty_19 = zext i7 %1 to i22
  %empty_20 = shl i22 %empty, 7
  %empty_21 = or i22 %empty_20, %empty_19
  ret i22 %empty_21
}

define weak i22 @_ssdm_op_BitConcatenate.i22.i11.i11(i11, i11) nounwind readnone {
entry:
  %empty = zext i11 %0 to i22
  %empty_22 = zext i11 %1 to i22
  %empty_23 = shl i22 %empty, 11
  %empty_24 = or i22 %empty_23, %empty_22
  ret i22 %empty_24
}

define weak i15 @_ssdm_op_BitConcatenate.i15.i8.i7(i8, i7) nounwind readnone {
entry:
  %empty = zext i8 %0 to i15
  %empty_25 = zext i7 %1 to i15
  %empty_26 = shl i15 %empty, 7
  %empty_27 = or i15 %empty_26, %empty_25
  ret i15 %empty_27
}

define weak i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8, i6) nounwind readnone {
entry:
  %empty = zext i8 %0 to i14
  %empty_28 = zext i6 %1 to i14
  %empty_29 = shl i14 %empty, 6
  %empty_30 = or i14 %empty_29, %empty_28
  ret i14 %empty_30
}

declare void @_ssdm_SpecDependence(...) nounwind

declare void @_GLOBAL__I_a() nounwind

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 23, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"inter_pix.V", metadata !11, metadata !"int24", i32 0, i32 23}
!11 = metadata !{metadata !12, metadata !13}
!12 = metadata !{i32 0, i32 1079, i32 1}
!13 = metadata !{i32 0, i32 1919, i32 1}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 0, i32 23, metadata !16}
!16 = metadata !{metadata !17}
!17 = metadata !{metadata !"out_pix.V", metadata !11, metadata !"int24", i32 0, i32 23}
!18 = metadata !{metadata !19}
!19 = metadata !{i32 0, i32 31, metadata !20}
!20 = metadata !{metadata !21}
!21 = metadata !{metadata !"rows", metadata !22, metadata !"int", i32 0, i32 31}
!22 = metadata !{metadata !23}
!23 = metadata !{i32 0, i32 0, i32 0}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 31, metadata !26}
!26 = metadata !{metadata !27}
!27 = metadata !{metadata !"cols", metadata !22, metadata !"int", i32 0, i32 31}
