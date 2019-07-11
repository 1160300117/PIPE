/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001182667390_2351635246_init();
    work_m_00000000002855373487_1119861224_init();
    work_m_00000000003931214063_1256197513_init();
    work_m_00000000002062562409_2381739659_init();
    work_m_00000000002097147798_2760995339_init();
    work_m_00000000000708241518_1667949733_init();
    work_m_00000000003338955463_2977824221_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003338955463_2977824221");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
