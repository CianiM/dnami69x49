

!***********************************************************
!                                                           
! Start building layers for BC : i1 j1 None ****************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: 1 0 None ***************************************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None d ********
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! d
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None d *********************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(1)) =  qst(1-2+1,1-2+0,indvarsst(1))



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None eta ******
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! eta
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None eta *******************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(2)) =  qst(1-2+1,1-2+0,indvarsst(2))



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None ksi ******
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! ksi
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None ksi *******************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(3)) =  qst(1-2+1,1-2+0,indvarsst(3))



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None symm *****
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! ((sign(1.0_wp,ksi)-1.0_wp)/(-2.0_wp))
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None symm ******************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(5)) =  ((sign(1.0_wp,qst(1-2+1,1-2+0,indvarsst(3)))-&
                    1.0_wp)/(-&
                    2.0_wp))



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None detady ***
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! [eta]_1y
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_detady_dy_0_1m2p11m2p0p0k = qst(1-2+1,1-2+0+0,indvarsst(2))

d1_detady_dy_0_1m2p11m2p0p1k = qst(1-2+1,1-2+0+1,indvarsst(2))

d1_detady_dy_0_1m2p11m2p0p2k = qst(1-2+1,1-2+0+2,indvarsst(2))

d1_detady_dy_0_1m2p11m2p0k = -&
          1.5_wp*d1_detady_dy_0_1m2p11m2p0p0k+&
          2.0_wp*d1_detady_dy_0_1m2p11m2p0p1k-&
          0.5_wp*d1_detady_dy_0_1m2p11m2p0p2k

d1_detady_dy_0_1m2p11m2p0k = d1_detady_dy_0_1m2p11m2p0k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None detady ****************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(6)) =  d1_detady_dy_0_1m2p11m2p0k



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None dksidy ***
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! [ksi]_1y
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_dksidy_dy_0_1m2p11m2p0p0k = qst(1-2+1,1-2+0+0,indvarsst(3))

d1_dksidy_dy_0_1m2p11m2p0p1k = qst(1-2+1,1-2+0+1,indvarsst(3))

d1_dksidy_dy_0_1m2p11m2p0p2k = qst(1-2+1,1-2+0+2,indvarsst(3))

d1_dksidy_dy_0_1m2p11m2p0k = -&
          1.5_wp*d1_dksidy_dy_0_1m2p11m2p0p0k+&
          2.0_wp*d1_dksidy_dy_0_1m2p11m2p0p1k-&
          0.5_wp*d1_dksidy_dy_0_1m2p11m2p0p2k

d1_dksidy_dy_0_1m2p11m2p0k = d1_dksidy_dy_0_1m2p11m2p0k*param_float(2)



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None dksidy ****************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(7)) =  d1_dksidy_dy_0_1m2p11m2p0k



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None detadx ***
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! [eta]_1x
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_detadx_dx_0_1m2p1m11m2p0k = qst(1-2+1-1,1-2+0,indvarsst(2))

d1_detadx_dx_0_1m2p1p11m2p0k = qst(1-2+1+1,1-2+0,indvarsst(2))

d1_detadx_dx_0_1m2p11m2p0k = -&
          0.5_wp*d1_detadx_dx_0_1m2p1m11m2p0k+&
          0.5_wp*d1_detadx_dx_0_1m2p1p11m2p0k

d1_detadx_dx_0_1m2p11m2p0k = d1_detadx_dx_0_1m2p11m2p0k*param_float(1)



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None detadx ****************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(8)) =  d1_detadx_dx_0_1m2p11m2p0k



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None dksidx ***
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! ([ksi]_1x)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

d1_dksidx_dx_0_1m2p1m11m2p0k = qst(1-2+1-1,1-2+0,indvarsst(3))

d1_dksidx_dx_0_1m2p1p11m2p0k = qst(1-2+1+1,1-2+0,indvarsst(3))

d1_dksidx_dx_0_1m2p11m2p0k = -&
          0.5_wp*d1_dksidx_dx_0_1m2p1m11m2p0k+&
          0.5_wp*d1_dksidx_dx_0_1m2p1p11m2p0k

d1_dksidx_dx_0_1m2p11m2p0k = d1_dksidx_dx_0_1m2p11m2p0k*param_float(1)



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None dksidx ****************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(9)) =  (d1_dksidx_dx_0_1m2p11m2p0k)



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None deltaxI **
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! 1.0_wp/(dksidx)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None deltaxI ***************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(10)) =  1.0_wp/(qst(1-2+1,1-2+0,indvarsst(9)))



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None deltayI **
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! 1.0_wp/(detady)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None deltayI ***************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(11)) =  1.0_wp/(qst(1-2+1,1-2+0,indvarsst(6)))



!***********************************************************
!                                                           
! building source terms in RHS for layer 1 0 None wall *****
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! dabs(1-symm)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 1 0 None wall ******************
!                                                           
!***********************************************************


qst(1-2+1,1-2+0,indvarsst(12)) =  dabs(1-&
                    qst(1-2+1,1-2+0,indvarsst(5)))

