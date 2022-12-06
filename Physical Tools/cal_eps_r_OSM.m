function [ eps_r ] = cal_eps_r_OSM( T_C, osm, osm_n )
%CAL_EPS_R Summary of this function goes here
%   Detailed explanation goes here
if ischar(osm)
    switch osm
        case 'Betain'
            d = 18.2 ;
        case 'Proline'
            d = 21 ;
        otherwise
            d = 0 ;
            osm_n = 0 ;
    end

    eps_r = cal_eps_r(T_C) + d*osm_n/1000 ;
else
    eps_r = cal_eps_r(T_C) ;
end
end

