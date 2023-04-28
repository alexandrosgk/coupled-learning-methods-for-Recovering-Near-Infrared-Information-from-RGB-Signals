function [rec_spectra,test_hd,test_rgb] = coupled_autoencoders_testing(root_dir,path_of_images,var_gaussian,clusters,rgb_centr,w)

    [test_rgb,test_hd,~,~] = read_data_from_csvlist(root_dir,path_of_images);
    test_rgb=(test_rgb(1:1500,1:2100,:));
    test_rgb = double(test_rgb);

    test_hd=double(test_hd(1:1500, 1:2100, 4)); % Change the dimensionality of the data 
    imsize=size(test_rgb);


    %Reconstruct the hyperspectral Image
    [rec_spectra] = coupled_autoencoders_recon_Image(clusters,test_rgb, rgb_centr, imsize,w);
    rec_spectra=uint8(rec_spectra);
    rec_spectra(:,:,1)=(imgaussfilt(rec_spectra(:,:,1),var_gaussian)); 
    test_hd=(uint8(test_hd(:,:,:)));
    
end
