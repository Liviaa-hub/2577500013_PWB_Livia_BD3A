<?php
// Helper kecil: ambil nilai lama (dari input sebelumnya, atau dari data yang diedit)
function nilai($field, $barang)
{
    $lama = set_value($field, '', FALSE);
    if ($lama !== '') {
        return html_escape($lama);
    }
    return $barang ? html_escape($barang->$field) : '';
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= $judul ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4" style="max-width: 700px;">
  <h4 class="text-danger"><?= $judul ?></h4>
  <hr>

  <?php if ($this->session->flashdata('error')): ?>
    <div class="alert alert-danger py-2"><?= html_escape($this->session->flashdata('error')) ?></div>
  <?php endif; ?>
  <?php if (validation_errors()): ?>
    <div class="alert alert-danger py-2"><?= validation_errors('<div>', '</div>') ?></div>
  <?php endif; ?>

  <?= form_open_multipart($action) ?>

    <div class="mb-3">
      <label class="form-label">Kode Barang</label>
      <input type="text" name="kd_barang" class="form-control" maxlength="10"
             value="<?= nilai('kd_barang', $barang) ?>" <?= $barang ? 'readonly' : 'required' ?>>
    </div>

    <div class="mb-3">
      <label class="form-label">Nama Barang</label>
      <input type="text" name="nama_barang" class="form-control" maxlength="50"
             value="<?= nilai('nama_barang', $barang) ?>" required>
    </div>

    <div class="row">
      <div class="col-md-4 mb-3">
        <label class="form-label">Stok</label>
        <input type="number" name="stok" class="form-control" min="0"
               value="<?= nilai('stok', $barang) ?>" required>
      </div>
      <div class="col-md-4 mb-3">
        <label class="form-label">Harga (Rp)</label>
        <input type="number" name="harga" class="form-control" min="0"
               value="<?= nilai('harga', $barang) ?>" required>
      </div>
      <div class="col-md-4 mb-3">
        <label class="form-label">Berat (gr)</label>
        <input type="number" name="berat" class="form-control" min="0"
               value="<?= nilai('berat', $barang) ?>" required>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Satuan</label>
      <input type="text" name="satuan" class="form-control" maxlength="15"
             value="<?= nilai('satuan', $barang) ?>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Keterangan</label>
      <textarea name="keterangan" class="form-control" rows="2" maxlength="100"><?= nilai('keterangan', $barang) ?></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Gambar</label>
      <?php if ($barang && !empty($barang->gambar)): ?>
        <div class="mb-2">
          <img src="<?= base_url($folder . $barang->gambar) ?>" width="80" alt="">
          <small class="text-muted d-block">Kosongkan jika tidak ingin mengganti gambar.</small>
        </div>
      <?php endif; ?>
      <input type="file" name="gambar" class="form-control" accept="image/*">
    </div>

    <button type="submit" class="btn btn-primary">Simpan</button>
    <a href="<?= site_url('barang') ?>" class="btn btn-secondary">Batal</a>

  <?= form_close() ?>
</div>

</body>
</html>