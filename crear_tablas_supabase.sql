-- ============================================================
--  DESPACHO CONTABLE HERRERA — Script de creación de tablas
--  Pega este código en: Supabase → SQL Editor → New Query
-- ============================================================

-- 1. TABLA: clientes
CREATE TABLE IF NOT EXISTS clientes (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nombre        TEXT NOT NULL,
  rfc           TEXT,
  telefono      TEXT,
  email         TEXT,
  servicio      TEXT,
  honorarios    NUMERIC NOT NULL DEFAULT 0,
  meses_adeudo  INTEGER NOT NULL DEFAULT 0,
  notas         TEXT,
  fecha_registro TIMESTAMPTZ DEFAULT now()
);

-- 2. TABLA: pagos
CREATE TABLE IF NOT EXISTS pagos (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id   UUID REFERENCES clientes(id) ON DELETE CASCADE,
  fecha        DATE,
  monto        NUMERIC NOT NULL DEFAULT 0,
  tipo         TEXT,
  descripcion  TEXT,
  estado       TEXT DEFAULT 'pagado',
  meses        INTEGER,
  fecha_pago   DATE
);

-- 3. TABLA: extras
CREATE TABLE IF NOT EXISTS extras (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nombre       TEXT NOT NULL,
  telefono     TEXT,
  email        TEXT,
  tipo         TEXT,
  descripcion  TEXT,
  monto        NUMERIC NOT NULL DEFAULT 0,
  fecha        DATE
);

-- 4. Desactivar Row Level Security (para uso interno del despacho)
ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;
ALTER TABLE pagos    DISABLE ROW LEVEL SECURITY;
ALTER TABLE extras   DISABLE ROW LEVEL SECURITY;

-- ✅ ¡Listo! Las 3 tablas están creadas y listas para usar.
