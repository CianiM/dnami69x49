

!***********************************************************
!                                                           
! Start building layers for BC : i1 j1 None ****************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! BC layer: 0 0 None ***************************************
!                                                           
!***********************************************************




!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! Rho0
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho)/dt *************
!                                                           
!***********************************************************


q(1-2+0,1-2+0,indvars(1)) =  param_float(24 + 5)



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho u)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! U0
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho u)/dt ***********
!                                                           
!***********************************************************


q(1-2+0,1-2+0,indvars(2)) =  param_float(5 + 5)



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho v)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! 0.0_wp
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho v)/dt ***********
!                                                           
!***********************************************************


q(1-2+0,1-2+0,indvars(3)) =  0.0_wp



!***********************************************************
!                                                           
! building source terms in RHS for layer 0 0 None d(rho et)/dt 
!                                                           
!***********************************************************


!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
! T0*Cv+0.5_wp*(U0**2)
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!***********************************************************
!                                                           
! Update BC terms for layer 0 0 None d(rho et)/dt **********
!                                                           
!***********************************************************


q(1-2+0,1-2+0,indvars(4)) =  param_float(25 + 5)*param_float(4 + 5)+&
                    0.5_wp*(param_float(5 + 5)**2)
