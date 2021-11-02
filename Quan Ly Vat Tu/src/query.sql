use quanlyvattu;
#view1 Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập
use quanlyvattu;

create view vw_CTPNHAP as
select p.pnCode, p.pnId, v.vtId, c.soLuongNhap, c.donGiaNhap, (c.soLuongNhap * c.donGiaNhap) as 'Thanh tien'
from phieunhap p
         join chitietphieunhap c on p.pnId = c.pnId
         join vattu v on v.vtId = c.vtId;

#view2 Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP_VT as
select p.pnCode,
       v.vtId,
       v.vtName,
       c.soLuongNhap,
       c.donGiaNhap,
       (c.soLuongNhap * c.donGiaNhap) as 'Thanh tien nhap'
from phieunhap p
         join chitietphieunhap c on p.pnId = c.pnId
         join vattu v on v.vtId = c.vtId;

#view3 Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP_VT_PN as
select p.pnCode,
       p.pnNgayNhap,
       c2.ddhId,
       c2.soLuongDat,
       v.vtId,
       v.vtName,
       c.soLuongNhap,
       c.donGiaNhap,
       (c.soLuongNhap * c.donGiaNhap) as 'Thanh tien nhap'
from chitietphieunhap c
         join vattu v on c.vtId = v.vtId
         join phieunhap p on p.pnId = c.pnId
         join chitietdonhang c2 on v.vtId = c2.vtId and p.ddhId = c2.ddhId;


#view4: Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN_DH as
select p.pnCode,
       d.ddhNgayDatHang,
       c2.soLuongDat,
       n.nccCode,
       v.vtId,
       v.vtName,
       c.soLuongNhap,
       c.donGiaNhap,
       (c.soLuongNhap * c.donGiaNhap) as 'Thanh tien nhap'
from phieunhap p
         join chitietphieunhap c on p.pnId = c.pnId
         join vattu v on v.vtId = c.vtId
         join dondathang d on p.ddhId = d.ddhId
         join chitietdonhang c2 on c2.ctdhId = c.ctpnId
         join nhacungcap n on d.nccId = n.nccId;

#Câu 5.
create view vw_CTPNHAP_loc1 as
select p.pnCode, v.vtId, c.soLuongNhap, c.donGiaNhap, (c.soLuongNhap * c.donGiaNhap) as 'Thanh tien nhap'
from phieunhap p
         join chitietphieunhap c on p.pnId = c.pnId
         join vattu v on v.vtId = c.vtId
where c.soLuongNhap < 500;

#cau6 Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
create view vw_CTPNHAP_VT_loc as
select p.pnCode, v.vtId, c.soLuongNhap, c.donGiaNhap, (c.soLuongNhap * c.donGiaNhap) as 'Thanh tien nhap'
from phieunhap p
         join chitietphieunhap c on p.pnId = c.pnId
         join vattu v on v.vtId = c.vtId
where v.vtDonViTinh = 'bo';

#cau 7 Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
create view vw_CTPXUAT as
select p.pxCode, v.vtCode, c.soLuongXuat, c.donGiaXuat, (c.soLuongXuat * c.donGiaXuat) as 'Thanh Tien Xuat'
from vattu v
         join chitietphieuxuat c on v.vtId = c.vtId
         join phieuxuat p on c.pxId = p.pxId;

#cau 8 Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT as
select p.pxCode, v.vtCode, v.vtName, c.soLuongXuat, c.donGiaXuat
from vattu v
         join chitietphieuxuat c on v.vtId = c.vtId
         join phieuxuat p on c.pxId = p.pxId;

#cau 9
create view vw_CTPXUAT_VT_PX as
select p.pxCode, p.customerName, v.vtCode, v.vtName, c.soLuongXuat, c.donGiaXuat
from vattu v
         join chitietphieuxuat c on v.vtId = c.vtId
         join phieuxuat p on c.pxId = p.pxId;

#Procedure
#cau 2:
delimiter //
create procedure totalPriceExport(IN vtCode varchar(255), OUT tongTien bigint)
begin
    select sum(c.donGiaXuat * c.soLuongXuat)
    into tongTien
    from vattu v join chitietphieuxuat c on v.vtId = c.vtId
    where v.vtCode = vtCode;
end //
delimiter ;

call totalPriceExport('BepDien', @tongTien);
select @tongTien;

#cau1
delimiter //
create procedure total_Remaining_Products(IN vtCode varchar(255), OUT tongSpConLai bigint)
begin
    select  (t.tkSoLuongDau + t.tkSoLuongNhap - t.tkSoLuongXuat) as 'Số sản phẩm còn lại'
    into tongSpConLai
    from tonkho t
             join vattu v on v.vtId = t.vtId
    where v.vtCode = vtCode;
end //
delimiter ;
call total_Remaining_Products('LapTop', @tongSpConLai);
select @tongSpConLai;

#cau 3
delimiter //
create procedure total_order_quantity(IN ddhCode varchar(255), OUT tongSpDat int)
begin
    select sum(c.soLuongDat) as 'Tổng số lượng đặt'
    into tongSpDat
    from dondathang d
             join chitietdonhang c on d.ddhId = c.ddhId
    where d.ddhCode = ddhCode;
end//
delimiter ;

call total_order_quantity('DH1',@tongSpDat);
select @tongSpDat;

#cau 4
delimiter //
create procedure insertProductOrder(IN nccID int, IN ddhCode varchar(255), IN ddhNgayDatHang date)
begin
    insert into quanlyvattu.dondathang(nccId, ddhCode, ddhNgayDatHang) values (nccID, ddhCode, ddhNgayDatHang);
end //
delimiter ;
call insertProductOrder(3, 'DDH4', '2020-2-1');

#cau 5
delimiter //
create procedure insertProductDetails(IN ddhID int, IN vtID int, IN soLuongDat int)
begin
    insert into quanlyvattu.chitietdonhang(ddhId, vtId, soLuongDat) values (ddhID, vtID, soLuongDat);
end //
delimiter ;
call insertProductDetails(4, 1, 5000);